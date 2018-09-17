package hotdeal;

import java.util.ArrayList;

import reservation.ReservationVO;

public interface HotdealImpl {

	public int getTotalCount();
	
	public ArrayList<HotdealDTO> hotdealList(int s, int e);
	
	//hotdeal View뽑기
	public HotdealDTO hotdealView(String r, String l, String m, String a);
	
	//예약 후 저장하기
	public int insertHotdealReser(ReservationVO reserVO);
	
	//m_point 차감하기
	public int decreaseM_point(int m_point, String member_no);
	
	//핫딜 갯수 차감하기
	public int hotdeal_Sell_Count(int hotdeal_sell, String hotdeal_no);
}
