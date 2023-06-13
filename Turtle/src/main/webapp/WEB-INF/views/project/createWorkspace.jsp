<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/0041fb1dcb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/createWorkspace.css">

    <title>Document</title>
</head>
<body>
    <nav>
        <div class="logo-wrapper">
            <a class="logo"><img src="${contextPath}/resources/images/createWorkspace/LogoMakr-4qQRS5.png"></a>
        </div>


        <ul class="nav-links">
            <li><a href="#">소개</a></li>
            <li><a href="#">요금제</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
        


        <ul class="nav-links2">
            <li><a href="#"><i class="fa-regular fa-bell"></i></a></li> 
            <li><a href="#"><i class="fa-regular fa-circle-user"></i></a></li> 
        </ul>
    
        <a href="#" class="bar">
            <i class="fa-solid fa-bars"></i>
        </a>
    </nav>

    <section>
        <div>
            
        </div>

        <div class="section1">
            <a href="createProject"><i class="fa-solid fa-chevron-left"></i></a>
            <i class="fa-solid fa-layer-group">워크스페이스 관리</i>
        </div>
        <!-- 워크스페이스 이름 입력 section -->
        <div class="section2">
            <p>워크스페이스명 입력</p>
            <input type="text" placeholder="워크스페이스명을 입력해주세요.">

        </div>

        <!-- 워크스페이스 언어 설정 section -->
        <div class="language-section">

            <div class="workspace-language">
                <div><a><span>OS</span></a></div>
                <div><a><span>LANGUAGE</span></a></div>
                <div><a><span>TOOL</span></a></div>
                <div><a><span style="color: red;">SELECTED</span></a></div>
            </div>

            <div class="language" id="OS">
                <div class="img" name="OS">
                    <img src="${contextPath}/resources/images/createWorkspace/android-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="OS">
                    <img src="${contextPath}/resources/images/createWorkspace/windows8-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="OS">
                    <img src="${contextPath}/resources/images/createWorkspace/apple-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="OS">
                    <img src="${contextPath}/resources/images/createWorkspace/linux-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

            </div>

            <div class="language active" id="LANGUAGE">

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/csharp-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/C++.svg" >
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/css.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Git.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Go.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                    
                <div class="img" name="LANGUAGE"> 
                    <img src="${contextPath}/resources/images/createWorkspace/html.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Java.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/JavaScript.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/NodeJs.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Php.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Python.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/React.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Ruby.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>

                <div class="img" name="LANGUAGE">
                    <img src="${contextPath}/resources/images/createWorkspace/Sass.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>


            </div>

            <div class="language" id="TOOL">
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/bootstrap-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/docker-plain.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/dot-net-plain.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/github-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/mysql-plain.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/phoenix-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/slack-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/tomcat-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/vscode-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                <div class="img" name="TOOL">
                    <img src="${contextPath}/resources/images/createWorkspace/vuejs-original.svg">
                    <a><i class="fa-solid fa-circle-plus" style="color: #1f6df4;"></i></a>
                </div>
                



            </div>

            <div class="language" id="SELECTED">
           
            </div>

        </div>











        <!-- 워크스페이스 추가 section -->
     
        <div class="workspace">
            
         

            
        </div>
        <a class="plus-btn"><i class="fa-solid fa-circle-plus"></i></a>
        <div class="pop">
            <div class="pop-content">
                <div class="pop-content2">
                    <div><img src="${contextPath}/resources/images/createWorkspace/게시판.png" width="130px"></div>
                    <div class="content-name">
                        <div>게시판</div>
                        <div>게시글을 작성할 수 있습니다.</div>
                    </div>
                    
                </div>

                <div class="pop-content2">
                    <div><img src="${contextPath}/resources/images/createWorkspace/캘린더.png" width="130px"></div>
                    <div class="content-name">
                        <div>캘린더</div>
                        <div>일정을 입력할 수 있습니다.</div>
                    </div>
                    
                </div>

                <div class="pop-content2">
                    <div><img src="${contextPath}/resources/images/createWorkspace/스티커메모.png" width="130px"></div>
                    <div class="content-name">
                        <div>스티커 메모</div>
                        <div>메모를 작성할 수 있습니다.</div>
                    </div>
                    
                </div>

            
                <div class="pop-content2">
                    <div><img src="${contextPath}/resources/images/createWorkspace/깃 로드맵.png" width="130px"></div>
                    <div class="content-name">
                        <div>깃 로드맵</div>
                        <div>로드맵을 설정할 수 있습니다.</div>
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="next-btn">
            <a>생성하기</a>
        </div>

    </section>
    <script src="${contextPath}/resources/js/createWorkspace.js"></script>
</body>
</html>