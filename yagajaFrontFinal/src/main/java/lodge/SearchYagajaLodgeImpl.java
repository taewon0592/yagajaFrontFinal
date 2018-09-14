package lodge;

import java.util.ArrayList;

import org.json.simple.JSONArray;

public interface SearchYagajaLodgeImpl {
	
	//구군 검색
	public JSONArray gugun(String sido);

	// 숙박시설 리스트 게시물 수 카운트 하기
	public int getTotalCount2(String mode, String gugun);
	
	//검색결과 숙박시설 리스트 페이지 처리
	public ArrayList<SearchLodgeDTO> searchListPage(SearchParamListVO pmvo);
	
}