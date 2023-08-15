package models.validators;

import java.util.ArrayList;
import java.util.List;

import actions.views.MeetingView;
import constants.MessageConst;

/**
 * 商談インスタンスに設定されている値のバリデーションを行うクラス
 */
public class MeetingValidator {

    /**
     * 商談インスタンスの各項目についてバリデーションを行う
     * @param rv 商談インスタンス
     * @return エラーのリスト
     */
    public static List<String> validate(MeetingView mv) {
        List<String> errors = new ArrayList<String>();

        //会社名のチェック
        String companyNameError = validateCompanyName(mv.getCompanyName());
        if (!companyNameError.equals("")) {
            errors.add(companyNameError);
        }
        //お客様名のチェック
        String customerNameError = validateCustomerName(mv.getCustomerName());
        if (!customerNameError.equals("")) {
            errors.add(customerNameError);
        }

        //内容のチェック
        String meetingContentError = validateMeetingContent(mv.getMeetingContent());
        if (!meetingContentError.equals("")) {
            errors.add(meetingContentError);
        }
        //進捗状況のチェック
        String statusError = validateStatus(mv.getStatus());
        if (!statusError.equals("")) {
            errors.add(statusError);
        }

        return errors;
    }

    /**
     * 会社名に入力値があるかをチェックし、入力値がなければエラーメッセージを返却
     * @param companyName 会社名
     * @return エラーメッセージ
     */
    private static String validateCompanyName(String comapanyName) {
        if (comapanyName == null || comapanyName.equals("")) {
            return MessageConst.E_NOTITLE.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }

    /**
     * タイトルに入力値があるかをチェックし、入力値がなければエラーメッセージを返却
     * @param customerName お客様名
     * @return エラーメッセージ
     */
    private static String validateCustomerName(String customerName) {
        if (customerName == null || customerName.equals("")) {
            return MessageConst.E_NOTITLE.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }

    /**
     * 内容に入力値があるかをチェックし、入力値がなければエラーメッセージを返却
     * @param content 内容
     * @return エラーメッセージ
     */
    private static String validateMeetingContent(String meetingContent) {
        if (meetingContent == null || meetingContent.equals("")) {
            return MessageConst.E_NOCONTENT.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }

    /**
     * 進捗状況に入力値があるかをチェックし、入力値がなければエラーメッセージを返却
     * @param status 進捗状況
     * @return エラーメッセージ
     */
    private static String validateStatus(String status) {
        if (status == null || status.equals("")) {
            return MessageConst.E_NOTITLE.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }
}