package yagajaFront.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.ReservationVO;

public class SMSForm {

	public String SMSForm(HttpServletRequest request, HttpServletResponse response, ReservationVO vo) throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		String reser_name = vo.getReser_name();
		String lodge_name = vo.getLodge_name();
		String room_type = vo.getRoom_type();
		String check_in = vo.getCheck_in();
		String check_out = vo.getCheck_out();
		String reser_no = vo.getReser_no();
		
		System.out.println("reser_name:"+reser_name);
		System.out.println("lodge_name:"+lodge_name);

		System.out.println("room_type:"+room_type);

		System.out.println("check_in:"+check_in);

		String content = "";
		
		if(reser_no != null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			content = ""//request.getParameter("content");
			
			 + "[야가자 예약] "
			 + reser_name + " 님의 예약이 완료 되었습니다. "
			 + " ▶예약정보◀ "
			 + lodge_name + "(" + room_type + ") "
			 + " 입실일시 : " + check_in
			 + " 예약번호 : " + reser_no;
			out.println(content);
		}
		System.out.println("content:"+content);
		return content;
	}
}
