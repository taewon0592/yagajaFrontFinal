package lodge;

public class SearchParamListVO {

	private String mode;
	private int start;
	private int end;
	private String gugun;

	public SearchParamListVO() {}

	public SearchParamListVO(String mode, int start, int end, String gugun) {
		this.mode = mode;
		this.start = start;
		this.end = end;
		this.gugun = gugun;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

}
