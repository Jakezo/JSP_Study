package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.BlackDao;
import dto.BlackDto;

public class BlackJSONCommand implements BlackCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		/* 동작 확인용(DB를 사용 안 함) */
		/*
		JSONObject obj = new JSONObject();	// simple-json-1.1.1.jar(lib)
		obj.put("name","james");
		obj.put("age", 20);
		obj.put("gender","여");
		obj.put("phone","010-1111-1111");
		obj.put("address","속초");
		
		return obj.toJSONString();
		*/
		
		/* DB에 들어가 데이터 가져오기 */
		List<BlackDto> list = BlackDao.getInstance().list();
		
		// list를 JSON으로 만들기
		// JSONObject를 BlackDto로 보면 되기 때문에
		// list는 JSONArray로 보면 된다.
		JSONArray jsonArray = new JSONArray();
		
		for (BlackDto blackDto : list) {
			JSONObject obj = new JSONObject();
			obj.put("name", blackDto.getName());
			obj.put("age", blackDto.getAge());
			obj.put("gender", blackDto.getGender());
			obj.put("phone", blackDto.getPhone());
			obj.put("address", blackDto.getAddress());
			
			jsonArray.add(obj);	// JSONArray는 ArrayList처럼 사용한다.
		}
		return jsonArray.toJSONString();
	}

}
