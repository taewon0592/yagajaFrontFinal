package map;

import java.util.ArrayList;

public interface MapDAOImpl {	
	
	public ArrayList<MapDTO> mapSearch(String sql_searchWord);
	
	public ArrayList<MapDTO> search_local(String search_localZone);
	
	public ArrayList<MapDTO> mapData();
	
}
