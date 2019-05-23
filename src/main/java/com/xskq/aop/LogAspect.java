package com.xskq.aop;

import com.xskq.utils.DateUtils;
import org.aspectj.lang.JoinPoint;

import java.util.Date;

public class LogAspect {
	public void before(JoinPoint joinPoint){
		String clsname = joinPoint.getTarget().getClass().getName();
		String methodname = joinPoint.getSignature().getName();
		System.out.println("----------before-------------");
		System.out.println(DateUtils.dateToStrTime(new Date())+":"+clsname+"."+methodname);
		System.out.println("----------------------------");
	}
	public void after(JoinPoint joinPoint){
		System.out.println("-----------after-----------------");
		System.out.println("参数:");
		Object[] args = joinPoint.getArgs();
		for (int i = 0; i < args.length && args!=null; i++) {
			if(i == args.length -1){
				System.out.print(args[i]);
			}else{
				System.out.print(args[i]+",");
			}
		}
		System.out.println();
		System.out.println("---------------------------------");
	}
	public void afterReturn(JoinPoint joinPoint, Object result){
		System.out.println("执行结果:"+result);
	}
}
