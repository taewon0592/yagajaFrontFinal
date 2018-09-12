package reservation;

public interface ReservationImpl 
{
	//예약시스템에 먼저보여줄것들
	public ReservationVO reserView(String L, String R);
	
	//예약 후 저장하기
	public int insertReser(ReservationVO reserVO);
	
	//m_point 저장하기
	public int insertM_point(int m_point, String member_no);
}
