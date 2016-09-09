package com.kosta.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {
	
	//public void process(HttpServletRequest request, HttpServletResponse response) throws Throwable ;
	
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable ;
}
