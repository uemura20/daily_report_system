package services;

import java.time.LocalDateTime;
import java.util.List;

import actions.views.EmployeeConverter;
import actions.views.EmployeeView;
import actions.views.MeetingConverter;
import actions.views.MeetingView;
import constants.JpaConst;
import models.Meeting;
import models.validators.MeetingValidator;

/**
 * 商談テーブルの操作に関わる処理を行うクラス
 */
public class MeetingService extends ServiceBase {

    /**
     * 指定した従業員が作成した商談データを、指定されたページ数の一覧画面に表示する分取得しReportViewのリストで返却する
     * @param employee 従業員
     * @param page ページ数
     * @return 一覧画面に表示するデータのリスト
     */
    public List<MeetingView> getMinePerPage(EmployeeView employee, int page) {

        List<Meeting> meetings = em.createNamedQuery(JpaConst.Q_MET_GET_ALL_MINE, Meeting.class)
                .setParameter(JpaConst.JPQL_PARM_EMPLOYEE, EmployeeConverter.toModel(employee))
                .setFirstResult(JpaConst.ROW_PER_PAGE * (page - 1))
                .setMaxResults(JpaConst.ROW_PER_PAGE)
                .getResultList();
        return MeetingConverter.toViewList(meetings);
    }

    /**
     * 指定した従業員が作成した商談データの件数を取得し、返却する
     * @param employee
     * @return 商談データの件数
     */
    public long countAllMine(EmployeeView employee) {

        long count = (long) em.createNamedQuery(JpaConst.Q_MET_COUNT_ALL_MINE, Long.class)
                .setParameter(JpaConst.JPQL_PARM_EMPLOYEE, EmployeeConverter.toModel(employee))
                .getSingleResult();

        return count;
    }

    /**
     * 指定されたページ数の一覧画面に表示する商談データを取得し、ReportViewのリストで返却する
     * @param page ページ数
     * @return 一覧画面に表示するデータのリスト
     */
    public List<MeetingView> getAllPerPage(int page) {

        List<Meeting> meetings = em.createNamedQuery(JpaConst.Q_MET_GET_ALL, Meeting.class)
                .setFirstResult(JpaConst.ROW_PER_PAGE * (page - 1))
                .setMaxResults(JpaConst.ROW_PER_PAGE)
                .getResultList();
        return MeetingConverter.toViewList(meetings);
    }

    /**
     * 商談テーブルのデータの件数を取得し、返却する
     * @return データの件数
     */
    public long countAll() {
        long meetings_count = (long) em.createNamedQuery(JpaConst.Q_MET_COUNT, Long.class)
                .getSingleResult();
        return meetings_count;
    }

    /**
     * idを条件に取得したデータをReportViewのインスタンスで返却する
     * @param id
     * @return 取得データのインスタンス
     */
    public MeetingView findOne(int id) {
        return MeetingConverter.toView(findOneInternal(id));
    }

    /**
     * 画面から入力された商談の登録内容を元にデータを1件作成し、商談テーブルに登録する
     * @param rv 商談の登録内容
     * @return バリデーションで発生したエラーのリスト
     */
    public List<String> create(MeetingView mv) {
        List<String> errors = MeetingValidator.validate(mv);
        if (errors.size() == 0) {
            LocalDateTime ldt = LocalDateTime.now();
            mv.setCreatedAt(ldt);
            mv.setUpdatedAt(ldt);
            createInternal(mv);
        }

        //バリデーションで発生したエラーを返却（エラーがなければ0件の空リスト）
        return errors;
    }

    /**
     * 画面から入力された商談の登録内容を元に、商談データを更新する
     * @param rv 商談の更新内容
     * @return バリデーションで発生したエラーのリスト
     */
    public List<String> update(MeetingView mv) {

        //バリデーションを行う
        List<String> errors = MeetingValidator.validate(mv);

        if (errors.size() == 0) {

            //更新日時を現在時刻に設定
            LocalDateTime ldt = LocalDateTime.now();
            mv.setUpdatedAt(ldt);

            updateInternal(mv);
        }

        //バリデーションで発生したエラーを返却（エラーがなければ0件の空リスト）
        return errors;
    }

    /**
     * idを条件にデータを1件取得する
     * @param id
     * @return 取得データのインスタンス
     */
    private Meeting findOneInternal(int id) {
        return em.find(Meeting.class, id);
    }

    /**
     * 商談データを1件登録する
     * @param rv 商談データ
     */
    private void createInternal(MeetingView mv) {

        em.getTransaction().begin();
        em.persist(MeetingConverter.toModel(mv));
        em.getTransaction().commit();

    }

    /**
     * 商談データを更新する
     * @param rv 商談データ
     */
    private void updateInternal(MeetingView mv) {

        em.getTransaction().begin();
        Meeting m = findOneInternal(mv.getId());
        MeetingConverter.copyViewToModel(m, mv);
        em.getTransaction().commit();

    }

}