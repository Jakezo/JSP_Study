package dto;

import java.sql.Date;

public class GreenDto {

	private int no;
	private String writer;
	private String title;
	private String content;
	private int hit;
	private Date postDate;
	
	public final int getNo() {
		return no;
	}
	public final void setNo(int no) {
		this.no = no;
	}
	public final String getWriter() {
		return writer;
	}
	public final void setWriter(String writer) {
		this.writer = writer;
	}
	public final String getTitle() {
		return title;
	}
	public final void setTitle(String title) {
		this.title = title;
	}
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
	public final int getHit() {
		return hit;
	}
	public final void setHit(int hit) {
		this.hit = hit;
	}
	public final Date getPostDate() {
		return postDate;
	}
	public final void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
}
