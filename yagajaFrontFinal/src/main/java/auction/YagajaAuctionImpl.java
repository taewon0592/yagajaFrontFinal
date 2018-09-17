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
   
   //auction 입찰하기
   public int auctionUpdate(String end_price, String member_nickname, String member_no, String auction_no);
   
   //경매내역 리스트 뽑기
   public int auctionListgetTotalCount(String member_no);
   
   //경매 예약리스트
   public ArrayList<YagajaAuctionDTO> auctionReserList(String member_no, int s, int e);

   
}
 