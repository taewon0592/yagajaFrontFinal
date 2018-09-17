package reservation;

import java.util.ArrayList;

public interface ReservationImpl 
{
   //예약시스템에 먼저보여줄것들
   public ReservationVO reserView(String L, String R);
   
   //예약 후 저장하기
   public int insertReser(ReservationVO reserVO);
   
   //m_point 저장하기
   public int insertM_point(int m_point, String member_no);
   
   //예약내역 개수구하기
   public int getTotalCount(String member_no);
   
   //예약내역 리스트뽑기
   public ArrayList<ReservationVO> reserVationList(int s, int e);

   //예약취소하기
   public int reserCancle(String reser_no);
   
   //예약 sms보내기
   public ReservationVO reserSms();
}