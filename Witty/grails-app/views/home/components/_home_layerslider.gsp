%{--
  - Copyright (c) 2012. Witty Project.
  - Peter Szilagyi
  - szpetip@gmail.com
  -
  - Witty is a a knowledge-management, open source community portal.
  - Witty is available under the http://wittypad.com.
  - Witty is a free software distributed under the GNU General Public Licence.
  - Witty and WittyPad are the name of the software, please do not use it to other purposes.
  --}%

<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 6/3/12
  Time: 4:02 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<slider:slider css="layerslider-home">
    <!-- Slide 1 -->
    <slider:defaultHomeSlide title="${message(code:'home.slides.slide1.title')}"
                             text="${message(code:'home.slides.slide1.text')}"
                             image="${resource(dir: '/images/home/slides', file: 'slide1_image.png')}"
                             style="left: 70px;top:15px"/>
    <!-- Slide 2 -->
    <slider:defaultHomeSlide title="${message(code:'home.slides.slide2.title')}"
                             text="${message(code:'home.slides.slide2.text')}"
                             image="${resource(dir: '/images/home/slides', file: 'slide2_image.png')}"
                             style="left: 70px;top:0"/>
    <!-- Slide 3 -->
    <slider:defaultHomeSlide title="${message(code:'home.slides.slide3.title')}"
                             text="${message(code:'home.slides.slide3.text')}"
                             image="${resource(dir: '/images/home/slides', file: 'slide3_image.png')}"
                             style="left: 20px;top:15px"/>

    <!-- Slide 4 -->
    <div class="ls-layer" rel="slidedelay: 3000">
        <img class="ls-s1" style="left: -30px;top:-20px"
             src="${resource(dir: '/images/home/slides', file: 'slide4_image1.png')}" alt="sublayer"
             rel="delayin: 1400;slidedirection: left; slideoutdirection: left;">
        <img class="ls-s1" style="left: -30px;top:-20px"
             src="${resource(dir: '/images/home/slides', file: 'slide4_image2.png')}" alt="sublayer"
             rel="delayin: 700;slidedirection: left; slideoutdirection: left;">
        <img class="ls-s1" style="left: -30px;top:-20px"
             src="${resource(dir: '/images/home/slides', file: 'slide4_image3.png')}" alt="sublayer"
             rel="delayin: 100;slidedirection: left; slideoutdirection: left;">

        <div class="ls-s1 slide-title"
             rel="delayin: 700;slidedirection: right; slideoutdirection: left;"><g:message
                code="home.slides.slide4.title"/></div>

        <div class="ls-s1 slide-text"
             rel="delayin: 1100;slidedirection: right; slideoutdirection: left;"><g:message
                code="home.slides.slide4.text"/></div>
        <img class="ls-s1" style="left: 840px;top:360px"
             src="${resource(dir: '/images/home/slides', file: 'slide_witty_logo.png')}" alt="sublayer"
             rel="slidedirection: bottom; slideoutdirection: bottom;">
    </div>
</slider:slider>
