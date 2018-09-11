package hotdeal;

import java.util.ArrayList;

public interface HotdealImpl {

	public int getTotalCount();
	
	public ArrayList<HotdealDTO> hotdealList(int s, int e);
}
