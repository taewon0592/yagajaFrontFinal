package yagajaFront.model;

import org.apache.commons.mail.HtmlEmail;
import member.YagajaMemberVO;

public class EmailUtil {

	public static void send_mail(YagajaMemberVO vo, String choice) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "yagaja37@naver.com"; // 본인의 아이디 입력
		String hostSMTPpwd = "freedom1205"; // 비밀번호 입력

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "yagaja37@naver.com"; // 보내는 사람 email
		String fromName = "야가자"; // 보내는 사람 별명
		String subject = ""; // 제목
		String msg = ""; // 내용

		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		System.out.println(choice);
		if (choice.equals("passcheck")) {
			subject = "[야가자] 임시 비밀번호를 보내드립니다";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<font style='color: #FF205C;'>";
			msg += vo.getId() + "</font>님의 임시비밀번호는 <font style='color: #FF205C;'>" + vo.getPass() + "</font>입니다.<br/>";
			msg += "아래 버튼를 눌러 로그인을 계속 해주세요.";
			msg += "<br/><a href='http://localhost:8282/yagajaFinal/member/login.do'><button type='button'>버튼</button></a></div>";
			
		}else if(choice.equals("idsearch")){
			subject = "[야가자] 찾으신 귀하의 아이디입니다";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "귀하의 아이디는 <font style='color: #FF205C;'>" + vo.getId() + "</font>입니다.<br/>";
			msg += "아래 버튼를 눌러 로그인을 계속 해주세요.";
			msg += "<br/><a href='http://localhost:8282/yagajaFinal/member/login.do'><button type='button'>버튼</button></a></div>";
		}

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // SMTP 포트 번호 입력

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg); // 본문 내용
			email.send();

		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
			e.printStackTrace();
		}
	}
}
