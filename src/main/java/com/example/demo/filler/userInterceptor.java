package com.example.demo.filler;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class userInterceptor implements HandlerInterceptor {

        @Override
        public boolean preHandle(

                HttpServletRequest request,
                HttpServletResponse response,
                Object handler

        )throws Exception{

            Object object = request.getSession().getAttribute("userLogged1");
            Users user = (Users) object;

            if(user == null){
                
                response.sendRedirect(request.getContextPath() + "/login");
                return false;

            }
            if(user.getRole() != RoleEnum.MENBER){
                response.setStatus(404);
                response.sendRedirect(request.getContextPath() + "/404");
                return false;
            }

            return true;

        }


    @Override
    public void postHandle(

            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView

    ) throws Exception {

        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);

        }


    @Override
    public void afterCompletion(

            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            Exception ex

    )throws Exception {

        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);

    }
}
