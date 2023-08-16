package actions.views;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 商談情報について画面の入力値・出力値を扱うViewモデル
 *
 */
@Getter //全てのクラスフィールドについてgetterを自動生成する(Lombok)
@Setter //全てのクラスフィールドについてsetterを自動生成する(Lombok)
@NoArgsConstructor //引数なしコンストラクタを自動生成する(Lombok)
@AllArgsConstructor //全てのクラスフィールドを引数にもつ引数ありコンストラクタを自動生成する(Lombok)
public class MeetingView {

    /**
     * id
     */
    private Integer id;

    /**
     * 商談を登録した従業員
     */
    private EmployeeView employee;

    /**
     * いつの商談かを示す日付
     */
    private LocalDate meetingDate;

    /**
     * 商談の会社名
     */
    private String company_name;

    /**
     * 商談のお客様名
     */
    private String customer_name;

    /**
     * 商談の内容
     */
    private String meeting_content;

    /**
     * 商談の進捗状況
     */
    private String status;

    /**
     * 登録日時
     */
    private LocalDateTime createdAt;

    /**
     * 更新日時
     */
    private LocalDateTime updatedAt;
}