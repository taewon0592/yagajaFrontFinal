package auction;

import java.util.ArrayList;

public interface YagajaAuctionImpl 
{
	//auction 전체 레코드수 구하기
	public int getTotalCount();
	
	//auction list뽑기
	public ArrayList<YagajaAuctionDTO> auctionList(int s, int e);
	
	//auction View뽑기
	public YagajaAuctionDTO auctionView(String r, String l, String m, String a);
	
}
 