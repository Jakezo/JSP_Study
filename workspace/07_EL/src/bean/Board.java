package bean;

import java.sql.Date;

public class Board {

	// field
	private String title;
	private String writer;
	private String context;
	private Date date;
	
	// constructor
	public Board() {  }
	
	public Board(String title, String writer, String context, Date date) {
		super();
		this.title = title;
		this.writer = writer;
		this.context = context;
	}

	// method
	public final String getTitle() {
		return title;
	}

	public final void setTitle(String title) {
		this.title = title;
	}

	public final String getWriter() {
		return writer;
	}

	public final void setWriter(String writer) {
		this.writer = writer;
	}

	public final String getContext() {
		return context;
	}

	public final void setContext(String context) {
		this.context = context;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
