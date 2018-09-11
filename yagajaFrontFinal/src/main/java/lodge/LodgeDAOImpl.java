package lodge;

import java.util.ArrayList;

public interface LodgeDAOImpl {

	// 숙박시설 리스트 게시물 수 카운트 하기
	public int getTotalCount(String mode);
	
	// 숙박시설 리스트 페이지 처리
	public ArrayList<LodgeDTO> listPage(ParamListVO pmvo);
}
