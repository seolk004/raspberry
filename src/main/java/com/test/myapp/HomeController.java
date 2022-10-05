package com.test.myapp;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.myapp.dto.FileDTO;
import com.test.myapp.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
//����ؼ� ������ ����� ���� �����ϴ� ���� �ſ� �� ȿ�����̱� ������ 
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) throws Exception{

		return "home/home";
	}

    @ResponseBody
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	public void login(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		session = request.getSession();
		String id = request.getParameter("exampleInputEmail");
		String pw = request.getParameter("exampleInputPassword");

		System.out.println(id);
		System.out.println(pw);
		String name = memberService.getName(id, pw);
		System.out.println(name);

		if (name != null && name != "") {
			PrintWriter out = response.getWriter();
			session.setAttribute("exampleInputEmail", id);
			out.println("<script>alert('환영합니다.'); </script>");
			out.println("<script>self.location ='/main'; </script>");
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			response.setStatus(401);
			out.println("<script>alert('계정을 다시 확인해주십시오.'); </script>");
			out.println("<script>self.location ='/'; </script>");
			out.flush();
		}
	}


	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "home/join";
	}

	@ResponseBody
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void join(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}

		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String gender = request.getParameter("userGender");
		String name = request.getParameter("userName");
		String authority = request.getParameter("userAuthority");

		System.out.println(id);
		System.out.println(pw);
		System.out.println(gender);
		System.out.println(name);
		System.out.println(authority);

		memberService.setUser(id, pw, gender, name, authority);
 
	}

	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String fileList()throws Exception{
		return "home/main";
	}

	@ResponseBody
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public ModelAndView fileList(HttpSession session) throws Exception{

		ModelAndView mv = null;

			List<FileDTO> fileDto = memberService.getFile();

			mv = new ModelAndView();

			mv.addObject("file",fileDto);
			System.out.println(memberService.getFile());
			System.out.println("왜 안돼?");

			mv.setViewName("home/main");

		return mv;

	}

	@RequestMapping(value = "/file-upload", method = RequestMethod.GET)
	public String fileupload(HttpServletRequest request) throws Exception{

		return "home/file-upload";
	}
	@RequestMapping(value = "/file-view", method = RequestMethod.GET)
	public String fileview(HttpServletRequest request) throws Exception{

		return "home/file-view";
	}

	@RequestMapping(value ="/error", method = RequestMethod.GET)
	public String error(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setStatus(404);
		return "home/error";
	}
}
