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
        String company_nameError = validateCompany_name(mv.getCompany_name());
        if (!company_nameError.equals("")) {
            errors.add(company_nameError);
        }
        //お客様名のチェック
        String customer_nameError = validateCustomer_name(mv.getCustomer_name());
        if (!customer_nameError.equals("")) {
            errors.add(customer_nameError);
        }

        //内容のチェック
        String meeting_contentError = validateMeeting_content(mv.getMeeting_content());
        if (!meeting_contentError.equals("")) {
            errors.add(meeting_contentError);
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
    private static String validateCompany_name(String comapany_name) {
        if (comapany_name == null || comapany_name.equals("")) {
            return MessageConst.E_NOCOMPANY_NAME.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }

    /**
     * タイトルに入力値があるかをチェックし、入力値がなければエラーメッセージを返却
     * @param customerName お客様名
     * @return エラーメッセージ
     */
    private static String validateCustomer_name(String customer_name) {
        if (customer_name == null || customer_name.equals("")) {
            return MessageConst.E_NOCUSTOMER_NAME.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }

    /**
     * 内容に入力値があるかをチェックし、入力値がなければエラーメッセージを返却
     * @param content 内容
     * @return エラーメッセージ
     */
    private static String validateMeeting_content(String meeting_content) {
        if (meeting_content == null || meeting_content.equals("")) {
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
            return MessageConst.E_NOSTATUS.getMessage();
        }

        //入力値がある場合は空文字を返却
        return "";
    }
}