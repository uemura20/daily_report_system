package actions.views;

import java.util.ArrayList;
import java.util.List;

import models.Meeting;

/**
 * 日報データのDTOモデル⇔Viewモデルの変換を行うクラス
 *
 */
public class MeetingConverter {

    /**
     * ViewモデルのインスタンスからDTOモデルのインスタンスを作成する
     * @param rv ReportViewのインスタンス
     * @return Reportのインスタンス
     */
    public static Meeting toModel(MeetingView mv) {
        return new Meeting(
                mv.getId(),
                EmployeeConverter.toModel(mv.getEmployee()),
                mv.getMeetingDate(),
                mv.getCompanyName(),
                mv.getCustomerName(),
                mv.getMeetingContent(),
                mv.getStatus(),
                mv.getCreatedAt(),
                mv.getUpdatedAt());
    }

    /**
     * DTOモデルのインスタンスからViewモデルのインスタンスを作成する
     * @param r Reportのインスタンス
     * @return ReportViewのインスタンス
     */
    public static MeetingView toView(Meeting m) {

        if (m == null) {
            return null;
        }

        return new MeetingView(
                m.getId(),
                EmployeeConverter.toView(m.getEmployee()),
                m.getMeetingDate(),
                m.getCompany_name(),
                m.getCustomer_name(),
                m.getMeetingContent(),
                m.getStatus(),
                m.getCreatedAt(),
                m.getUpdatedAt());
    }

    /**
     * DTOモデルのリストからViewモデルのリストを作成する
     * @param list DTOモデルのリスト
     * @return Viewモデルのリスト
     */
    public static List<MeetingView> toViewList(List<Meeting> list) {
        List<MeetingView> mvs = new ArrayList<>();

        for (Meeting m : list) {
            mvs.add(toView(m));
        }

        return mvs;
    }

    /**
     * Viewモデルの全フィールドの内容をDTOモデルのフィールドにコピーする
     * @param r DTOモデル(コピー先)
     * @param rv Viewモデル(コピー元)
     */
    public static void copyViewToModel(Meeting m, MeetingView mv) {
        m.setId(mv.getId());
        m.setEmployee(EmployeeConverter.toModel(mv.getEmployee()));
        m.setMeetingDate(mv.getMeetingDate());
        m.setCompany_name(mv.getCompanyName());
        m.setCustomer_name(mv.getCustomerName());
        m.setMeetingContent(mv.getMeetingContent());
        m.setStatus(mv.getStatus());
        m.setCreatedAt(mv.getCreatedAt());
        m.setUpdatedAt(mv.getUpdatedAt());

    }

}