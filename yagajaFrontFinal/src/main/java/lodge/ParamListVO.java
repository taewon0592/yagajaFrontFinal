package lodge;

public class ParamListVO {

	private String mode;
	private int start;
	private int end;

	public ParamListVO() {}

	public ParamListVO(String mode, int start, int end) {
		this.mode = mode;
		this.start = start;
		this.end = end;
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
	
	
	
	
}
