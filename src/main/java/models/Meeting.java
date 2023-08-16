package models;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import constants.JpaConst;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 商談データのDTOモデル
 *
 */
@Table(name = JpaConst.TABLE_MET)
@NamedQueries({
    @NamedQuery(
            name = JpaConst.Q_MET_GET_ALL,
            query = JpaConst.Q_MET_GET_ALL_DEF),
    @NamedQuery(
            name = JpaConst.Q_MET_COUNT,
            query = JpaConst.Q_MET_COUNT_DEF),
    @NamedQuery(
            name = JpaConst.Q_MET_GET_ALL_MINE,
            query = JpaConst.Q_MET_GET_ALL_MINE_DEF),
    @NamedQuery(
            name = JpaConst.Q_MET_COUNT_ALL_MINE,
            query = JpaConst.Q_MET_COUNT_ALL_MINE_DEF)
})

@Getter //全てのクラスフィールドについてgetterを自動生成する(Lombok)
@Setter //全てのクラスフィールドについてsetterを自動生成する(Lombok)
@NoArgsConstructor //引数なしコンストラクタを自動生成する(Lombok)
@AllArgsConstructor //全てのクラスフィールドを引数にもつ引数ありコンストラクタを自動生成する(Lombok)
@Entity
public class Meeting {

    /**
     * id
     */
    @Id
    @Column(name = JpaConst.MET_COL_ID)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 商談を登録した従業員
     */
    @ManyToOne
    @JoinColumn(name = JpaConst.MET_COL_EMP, nullable = false)
    private Employee employee;

    /**
     * いつの商談かを示す日付
     */
    @Column(name = JpaConst.MET_COL_REP_DATE, nullable = false)
    private LocalDate meetingDate;

    /**
     * 商談の会社名
     */
    @Lob
    @Column(name = JpaConst.MET_COL_COMPANY_NAME, nullable = false)
    private String company_name;

    /**
     * 商談のお客様名
     */
    @Lob
    @Column(name = JpaConst.MET_COL_CUSTOMER_NAME, nullable = false)
    private String customer_name;

    /**
     * 商談の内容
     */
    @Lob
    @Column(name = JpaConst.MET_COL_CONTENT, nullable = false)
    private String meeting_content;

    /**
     * 商談の進捗状況
     */
    @Lob
    @Column(name = JpaConst.MET_COL_STATUS, nullable = false)
    private String status;

    /**
     * 登録日時
     */
    @Column(name = JpaConst.MET_COL_CREATED_AT, nullable = false)
    private LocalDateTime createdAt;

    /**
     * 更新日時
     */
    @Column(name = JpaConst.MET_COL_UPDATED_AT, nullable = false)
    private LocalDateTime updatedAt;

}