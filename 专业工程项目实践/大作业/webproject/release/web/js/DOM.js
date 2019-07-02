import {getHTML} from "./htmlResolver.js";
import {getJSON, postFile} from "./jsonResolver.js";
//MainPage
export class MainPage{
    constructor(){
        this.bloggerID = document.getElementById("bloggerID").innerText;
        this.title = document.querySelector("title").innerText;
        this.desc = document.querySelector("meta[name=description]").content;
        this.articleList = document.querySelector(".article-list");
        this.articleCount = parseInt(document.getElementById("blog-count").textContent);
        this.btnMore = document.getElementById("moreclick");
        this.btnSearch = document.getElementById("search-btn");
        this.inputSearch = document.getElementById("search");
	    this.btnMore.addEventListener("click", this.loadMore.bind(this), false);
	    this.btnSearch.addEventListener("click", this.search.bind(this), false);
        // 分享模块
        let imgs = document.querySelectorAll("#container .content>aside .shareclick img");
        for (let i = 0; i < imgs.length; i++) {
            imgs[i].addEventListener("click", () => {
                this.goShare(imgs[i].alt);
            }, false);
        }
    }

    //获取更多日志
    loadMore(){
        let params = {
            "bloggerID": this.bloggerID,
            "mode": 1,
            "from": this.articleCount,
            "count": 4
        };
		getHTML(this,'/template/mainpage_article_list.jsp', params, (data) => {
		    if (null == data || "" == data.trim()){
		        this.btnMore.innerText = "没有更多的博客了";
		        this.btnMore.disabled = true;
            }
		    else {
                this.articleList.insertAdjacentHTML("beforeend", data);
                this.articleCount += 4;
            }
        });

    }

    //搜索日志
    search(){
        let topic = this.inputSearch.value;
        let mode = 2;
        if (topic === '文章搜索...') {
            mode = 1;
            this.btnMore.style.visibility = "visible";
        }
        else
            this.btnMore.style.visibility = "hidden";
        let params = {
            "mode": mode,
            "topic": topic
        };
        getHTML(this, '/template/mainpage_article_list.jsp', params, (data) => {
            this.articleList.innerHTML = data;
        })
    }

    goShare(s){
        //qq空间接口
        if (s === 'qzone')
            window.open('https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + document.location.href +
                '?sharesource=qzone&title=' + this.title + '&summary=' + this.desc);
        if (s === 'sina')
            window.open('http://service.weibo.com/share/share.php?url=' + document.location.href + '?sharesource=weibo&title=' +
                this.title);
        if (s === 'qq')
            window.open('http://connect.qq.com/widget/shareqq/index.html?url=' + document.location.href +
                '?sharesource=qzone&title=' + this.title + '&summary=' + this.desc);
    }

}

export class SignUp{
    constructor(){
        this.btnSubmit = document.getElementById("submitbutton");
        this.btnSubmit.addEventListener('click', this.ifsame);
    }
    ifsame() {
        let username = document.getElementById("username").value;
        let rePassword = document.getElementById("re-password").value;
        let password = document.getElementById("password").value;
        if (rePassword != password && rePassword!="" && password!="") {
            alert("两次密码输入不相同，请重新输入！");
            document.getElementById("re-password").value="";
            document.getElementById("password").value="";
        }
        else if(username=="" || rePassword=="" || password==""){
            alert("不能为空！");
        }
        else{
            let params = {
                "username": username,
                "password": password
            };
            getJSON(this, 'template/mainpage_signup.jsp', params, (data) => {
                let jsonObj = JSON.parse(data);
                if (jsonObj['status'] === "exist"){
                    alert("用户已存在");
                }
                else if (jsonObj['status'] === "success") {
                    alert("注册成功！");
                    window.location.href="sign_in.jsp";
                }
                else{
                    alert("未知错误");
                }
            })
        }
    }
}

export class SignIn{
    constructor(){
        this.registerButton = document.getElementById("submitbutton");
        this.registerButton.addEventListener("click", this.ifEmpty);
    }
    ifEmpty() {
        let username = document.getElementById("username").value;
        let password = document.getElementById("password").value;
        if(username=="" || password==""){
            alert("不能为空！");
        }
        else{
            let params = {
                "username": username,
                "password": password
            };
            getJSON(this, 'template/mainpage_signin.jsp', params, (data) => {
                let jsonObj = JSON.parse(data);
                if (jsonObj['status'] === "error"){
                    alert("用户名或密码错误");
                }
                else if (jsonObj['status'] === 'success') {
                    if (document.referrer === window.location.href)
                        window.location.href = '/';
                    else
                        window.location.href = document.referrer;
                }
                else{
                    alert('未知错误');
                }
            })
        }
    }
}

export class Setting{
    constructor(){
        this.inputPassword = document.getElementById("password");
        this.inputRPassword = document.getElementById("re-password");
        this.inputSignature = document.getElementById("set-signature");
        this.imgUpload = document.getElementById("upload-icon-preview");
        this.inputUpload = document.getElementById("upload-icon-input");
        this.inputUpload.addEventListener("change", this.refreshPreview.bind(this));
        this.btnSubmit = document.querySelector('.correct-inf');
        this.btnSubmit.addEventListener("click", this.updateInfo.bind(this));
    }
    refreshPreview(){
        let newsrc = getObjectURL(this.inputUpload.files[0]);
        this.imgUpload.src = newsrc;
    }
    updateInfo(){
        let rePassword = document.getElementById("re-password").value;
        let password = document.getElementById("password").value;
        let signature = document.getElementById("set-signature").value;
        let userIcon = document.getElementById("upload-icon-input").files[0];
        let formObj = document.querySelector("form");
        if (rePassword !== password) {
            alert("两次密码输入不相同，请重新输入！");
            document.getElementById("re-password").value="";
            document.getElementById("password").value="";
        }
        let params = {
            "password": password,
            "signature": signature,
            "userIcon": userIcon
        };
        postFile(this, 'template/setting_upgrade.jsp', params, (data) => {
            let jsonObj = JSON.parse(data);
            if (jsonObj['status'] === "success") {
                alert("更新成功！");
            }
            else if(jsonObj['status'] === "error"){
                alert("更新错误！");
            }
            else{
                alert("未知错误");
            }
        })
    }
}

function getObjectURL(file) {
    let url = null ;
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}