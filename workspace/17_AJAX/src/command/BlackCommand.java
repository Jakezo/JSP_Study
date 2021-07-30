package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface BlackCommand {

	/* 일반 Command */
	// public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response);
	
	/* AJAX Command */
	// 요청한 JSP로 값을 반환하므로 path, redirect/forward가 필요 없다.
	// 반환 값이 실제 데이터이다.
	// 모든 반환 값은 String 타입으로 반환한다.
	public String execute(HttpServletRequest request, HttpServletResponse response);
	
}