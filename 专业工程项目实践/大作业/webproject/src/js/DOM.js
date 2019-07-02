//Mainpage
class Mainpage{
    constructor(){	var btnMore = document.getElementById("moreclick");
	btnMore.addEventListener("click", this.loadMore, false);}
    //获取更多日志
    loadMore(){
        var articlelist = document.querySelector(".article-list");
        //TODO:Use requestHTML to acquire content
		var artstr =
			'<article class="all-article" id="next">\
								<header>\
									<div class="sign">\
										<span id="sign2">转载</span>\
										<div></div>\
									</div>\
									<h3><a href="#">二营长，来碗意大利面</a></h3>\
								</header>\
								<section>\
									<img src="img/lengtu.jpg" id="tinyimage">\
									<div class="tiny-article">\
										意大利面真好吃。\
									</div>\
								</section>\
								<footer>\
									<img src="img/time_gray.png" /> 2019-6-13 22:00\
									<img src="img/eye_gray.png" /> 22\
									<img src="img/comment_gray.png" /> <span class="comment-count">6</span>\
									<img src="img/fabulous_gray.png" /> <span class="fabulous-count">5</span>\
								</footer>\
							</article>';
		articlelist.insertAdjacentHTML("afterend", artstr);
        // 分享模块
        var imgs = document.querySelectorAll("#container .content>aside .shareclick img");
        for (var i = 0; i < imgs.length; i++) {
            imgs[i].addEventListener("click", function() {
                goShare(this.alt);
            }, false);
        }
    }

    goShare(s){
        var title = document.querySelector("title").innerText;
        var desc = document.querySelector("meta[name=description]").content;
        //qq空间接口
        if (s == 'qzone')
            window.open('https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + document.location.href +
                '?sharesource=qzone&title=' + title + '&summary=' + desc);
        if (s == 'sina')
            window.open('http://service.weibo.com/share/share.php?url=' + document.location.href + '?sharesource=weibo&title=' +
                title);
        if (s == 'qq')
            window.open('http://connect.qq.com/widget/shareqq/index.html?url=' + document.location.href +
                '?sharesource=qzone&title=' + title + '&summary=' + desc);
    }
}