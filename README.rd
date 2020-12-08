The 3EX SDK document details please move to Wiki to watch.
<div id="wiki-body" class="gollum-markdown-content">
            <div class="markdown-body">
              <h1>
<a id="user-content-行情" class="anchor" href="#%E8%A1%8C%E6%83%85" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>行情</h1>
<p>行情是一个完全公开的api，当前只提供了WebSocket的api。WebSocket协议是基于TCP的一种新的网络协议。它实现了客户端与服务器之间在单个 tcp 连接上的全双工通信，由服务器主动发送信息给客户端，减少了频繁的身份验证等不必要的开销。服务器不再是被动的接到客户端的请求后才返回数据，而是有了新数据后主动推送给客户端。WebSocket 只支持行情查询，交易接口将在后续提供.</p>
<h1>
<a id="user-content-请求与订阅说明" class="anchor" href="#%E8%AF%B7%E6%B1%82%E4%B8%8E%E8%AE%A2%E9%98%85%E8%AF%B4%E6%98%8E" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>请求与订阅说明</h1>
<h2>
<a id="user-content-1访问地址" class="anchor" href="#1%E8%AE%BF%E9%97%AE%E5%9C%B0%E5%9D%80" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>1.访问地址</h2>
<p>行情请求地址为：wss://marketinfo.3ex.com</p>
<h2>
<a id="user-content-2数据包描述" class="anchor" href="#2%E6%95%B0%E6%8D%AE%E5%8C%85%E6%8F%8F%E8%BF%B0" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>2.数据包描述:</h2>
<pre><code>数据会以2进制流方式传输, 每次上行及下行数据都包含一个特定包头格式:
	4字节 uint32 包体总长度;		
	4字节 uint32 请求的命令ID;		
	2字节 uint16 预留2字节;
</code></pre>
<h3>
<a id="user-content-命令id列表" class="anchor" href="#%E5%91%BD%E4%BB%A4id%E5%88%97%E8%A1%A8" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>命令ID列表</h3>
<pre><code>用户主动发送的上行命令ID列表	
</code></pre>
<blockquote>
<p>{</p>
<pre><code> 心跳请求命令ID		          : 6553601,

 请求订阅某市场的某币种命令ID         : 6553602,

 请求k线命令ID                       : 6553606,

 请求订阅的市场币种的24小时数据命令ID  : 6553610, 

 请求24小时币种变化命令ID             : 6553609,
</code></pre>
<p>};</p>
</blockquote>
<pre><code>服务端 主动下发的下行命令ID列表
</code></pre>
<blockquote>
<p>{</p>
<pre><code> 下发的成交信息命令ID             : 6553603,	

 下发的挂单数据命令ID             : 6553604,	

 下发的24小时币种变化命令ID       : 6553605,	

 返回k线数据命令ID                : 6553607,	

 当前分钟k线变化命令ID            : 6553608,
</code></pre>
<p>}</p>
</blockquote>
<h2>
<a id="user-content-3交互命令" class="anchor" href="#3%E4%BA%A4%E4%BA%92%E5%91%BD%E4%BB%A4" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>3.交互命令</h2>
<blockquote>
<p><strong>所有发送的字符串都需要在字符串流之前以16位(2字节)字符存储字符串长度.</strong></p>
</blockquote>
<h3>
<a id="user-content-1心跳-客户端需要每隔30秒向服务器发送一次心跳如果距离上一次心跳60秒没有收到新的心跳包服务器将断开连接" class="anchor" href="#1%E5%BF%83%E8%B7%B3-%E5%AE%A2%E6%88%B7%E7%AB%AF%E9%9C%80%E8%A6%81%E6%AF%8F%E9%9A%9430%E7%A7%92%E5%90%91%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%8F%91%E9%80%81%E4%B8%80%E6%AC%A1%E5%BF%83%E8%B7%B3%E5%A6%82%E6%9E%9C%E8%B7%9D%E7%A6%BB%E4%B8%8A%E4%B8%80%E6%AC%A1%E5%BF%83%E8%B7%B360%E7%A7%92%E6%B2%A1%E6%9C%89%E6%94%B6%E5%88%B0%E6%96%B0%E7%9A%84%E5%BF%83%E8%B7%B3%E5%8C%85%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%B0%86%E6%96%AD%E5%BC%80%E8%BF%9E%E6%8E%A5" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>1.	心跳. 客户端需要每隔30秒向服务器发送一次心跳,如果距离上一次心跳60秒没有收到新的心跳包,服务器将断开连接</h3>
<pre><code>uint32 `client_ts`; 客户端时间戳
</code></pre>
<h3>
<a id="user-content-2订阅特定币种信息-订阅成功后下发该币种的挂单数据成交数据当前币种24小时市场统计数据" class="anchor" href="#2%E8%AE%A2%E9%98%85%E7%89%B9%E5%AE%9A%E5%B8%81%E7%A7%8D%E4%BF%A1%E6%81%AF-%E8%AE%A2%E9%98%85%E6%88%90%E5%8A%9F%E5%90%8E%E4%B8%8B%E5%8F%91%E8%AF%A5%E5%B8%81%E7%A7%8D%E7%9A%84%E6%8C%82%E5%8D%95%E6%95%B0%E6%8D%AE%E6%88%90%E4%BA%A4%E6%95%B0%E6%8D%AE%E5%BD%93%E5%89%8D%E5%B8%81%E7%A7%8D24%E5%B0%8F%E6%97%B6%E5%B8%82%E5%9C%BA%E7%BB%9F%E8%AE%A1%E6%95%B0%E6%8D%AE" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>2.	订阅特定币种信息. 订阅成功后,下发该币种的挂单数据,成交数据,当前币种24小时市场统计数据</h3>
<pre><code>string `market`; 市场名称
string `coin`; 币种名称
</code></pre>
<h3>
<a id="user-content-3订阅特定职场所有币种24小时信息-订阅成功后下发特定市场中所有币种的24小时市场统计数" class="anchor" href="#3%E8%AE%A2%E9%98%85%E7%89%B9%E5%AE%9A%E8%81%8C%E5%9C%BA%E6%89%80%E6%9C%89%E5%B8%81%E7%A7%8D24%E5%B0%8F%E6%97%B6%E4%BF%A1%E6%81%AF-%E8%AE%A2%E9%98%85%E6%88%90%E5%8A%9F%E5%90%8E%E4%B8%8B%E5%8F%91%E7%89%B9%E5%AE%9A%E5%B8%82%E5%9C%BA%E4%B8%AD%E6%89%80%E6%9C%89%E5%B8%81%E7%A7%8D%E7%9A%8424%E5%B0%8F%E6%97%B6%E5%B8%82%E5%9C%BA%E7%BB%9F%E8%AE%A1%E6%95%B0" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>3.	订阅特定职场所有币种24小时信息, 订阅成功后,下发特定市场中所有币种的24小时市场统计数</h3>
<pre><code>string `market`; 市场名称
</code></pre>
<h3>
<a id="user-content-4获取k线信息" class="anchor" href="#4%E8%8E%B7%E5%8F%96k%E7%BA%BF%E4%BF%A1%E6%81%AF" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>4.	获取K线信息</h3>
<pre><code>string `market`; 市场名称
string `coin`; 币种名称
uint16 `type`; k线类型 1:分时图, 2:分钟线, 3:小时线, 4:日线 , 5:周线
uint16 `offset`; k线跨度 分钟线(1,5,15,30), 小时线(1,2,4,6,12),日线和周线(1)
uint32 `time`; k线结束时间戳 0:当前时间
</code></pre>
<h3>
<a id="user-content-5服务器下发挂单数据" class="anchor" href="#5%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8B%E5%8F%91%E6%8C%82%E5%8D%95%E6%95%B0%E6%8D%AE" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>5.	服务器下发挂单数据</h3>
<pre><code>String: {
		"n":"市场名:币种名",
		"b":[[价格,数量]],		//买单数组
		"s":[[价格,数量]		//卖单数组
		]
		}
</code></pre>
<h3>
<a id="user-content-6服务器下发成交数据" class="anchor" href="#6%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8B%E5%8F%91%E6%88%90%E4%BA%A4%E6%95%B0%E6%8D%AE" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>6.	服务器下发成交数据</h3>
<pre><code>String: [
		[
			价格,
			数量,
			时间戳,
			买卖类型(1买2卖)
		]
	]
</code></pre>
<h3>
<a id="user-content-7服务器下发当前币种24小时市场统计" class="anchor" href="#7%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8B%E5%8F%91%E5%BD%93%E5%89%8D%E5%B8%81%E7%A7%8D24%E5%B0%8F%E6%97%B6%E5%B8%82%E5%9C%BA%E7%BB%9F%E8%AE%A1" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>7.	服务器下发当前币种24小时市场统计</h3>
<pre><code>String: [最高价,最低价,成交量,涨跌百分比,显示名称,最新价, 人民币价值,美金价格,比特币价值]
</code></pre>
<h3>
<a id="user-content-8服务器下发当前分钟k线" class="anchor" href="#8%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8B%E5%8F%91%E5%BD%93%E5%89%8D%E5%88%86%E9%92%9Fk%E7%BA%BF" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>8.	服务器下发当前分钟k线</h3>
<pre><code>string  市场币种名称
string: [最高价,最低价,成交量,涨跌百分比,显示名称,最新价, 人民币价值,美金价格,比特币价值]
</code></pre>
<h3>
<a id="user-content-9服务器下发k线信息" class="anchor" href="#9%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8B%E5%8F%91k%E7%BA%BF%E4%BF%A1%E6%81%AF" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>9.	服务器下发K线信息</h3>
<pre><code>string `market`; 市场名称
string `coin`; 币种名称
uint16 `type`; k线类型 1:分时图, 2:分钟线, 3:小时线, 4:日线 , 5:周线
uint16 `offset`; k线跨度 分钟线(1,5,15,30), 小时线(1,2,4,6,12),日线和周线(1)
uint32 `time`; k线结束时间戳
String: [[时间戳,开始价格,最后价格,最低价格,最高价格,总额]]
</code></pre>
<h1>
<a id="user-content-代码示例" class="anchor" href="#%E4%BB%A3%E7%A0%81%E7%A4%BA%E4%BE%8B" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>代码示例:</h1>
<pre><code>在使用前请引用"Int64.js"和3exSDK.js"文件
下方例子提供以下API
</code></pre>
<h3>
<a id="user-content-订阅特定币种信息" class="anchor" href="#%E8%AE%A2%E9%98%85%E7%89%B9%E5%AE%9A%E5%B8%81%E7%A7%8D%E4%BF%A1%E6%81%AF" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>订阅特定币种信息</h3>
<pre><code>&lt;script type="text/JavaScript" src="Int64.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="3exSDK.js"&gt;&lt;/script&gt;
&lt;script *ype  ="text/javascript"&gt;
sdk = new threeExSDK({ 
host : "wss://marketinfo.3ex.com/", 
});  
sdk.connect();  
sdk.subInfo('USDT', 'BTC'); 	//订阅特定币种信息
				//参数
				//market: 市场名称
				//coin:	币种名称
				//
				//订阅成功后,下发该币种的挂单数据,成交数据,当前币种24小时市场统计数据

 //获取到挂单数据
 fn.MarketOrder=function(res){
	console.info("挂单数据:",res);
	/*{
		"n":"市场名:币种名",
		"b":[[价格,数量]],	//买单数组
		"s":[[价格,数量]		//卖单数组
		]
		}*/
};

 //获取到成交数据
 fn.MatchSuccessInfo=function(res){
	console.info("成交数据:",res);
	/*
	[
		[
			价格,
			数量,
			时间戳,
			买卖类型(1买2卖)
		]
	]
	*/
};


//当前币种24小时市场统计
fn.MarketWatch24HoursData=function(res){
	console.log("当前币种24小时市场统计:",res);
	/*
	[最高价,最低价,成交量,涨跌百分比,显示名称,最新价, 人民币价值,美金价格,比特币价值]
	*/ 
};
&lt;/script&gt;
</code></pre>
<h3>
<a id="user-content-订阅特定职场所有币种24小时信息" class="anchor" href="#%E8%AE%A2%E9%98%85%E7%89%B9%E5%AE%9A%E8%81%8C%E5%9C%BA%E6%89%80%E6%9C%89%E5%B8%81%E7%A7%8D24%E5%B0%8F%E6%97%B6%E4%BF%A1%E6%81%AF" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>订阅特定职场所有币种24小时信息</h3>
<pre><code>&lt;script type="text/JavaScript" src="Int64.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="3exSDK.js"&gt;&lt;/script&gt;
&lt;script *ype  ="text/javascript"&gt;
sdk = new threeExSDK({ 
host : "wss://marketinfo.3ex.com/", 
});  
sdk.connect();    
sdk.subMarketInfo('USDT');	//订阅特定市场的所有币种24小时统计信息
			//参数
			//market: 市场名称
			//
			//订阅成功后,下发特定市场中所有币种的24小时市场统计数据

//获取的24小时市场各币种统计
fn.Market24HoursData=function(res){
	console.log("24小时市场各币种统计:",res);
	/*
	{"市场名:币种名":[最高价,最低价,成交量,涨跌百分比,显示名称,最新价, 人民币价值,美金价格,比特币价值]}
	*/
};
&lt;/script&gt;
</code></pre>
<h3>
<a id="user-content-获取k线信息" class="anchor" href="#%E8%8E%B7%E5%8F%96k%E7%BA%BF%E4%BF%A1%E6%81%AF" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>获取K线信息</h3>
<pre><code>&lt;script type="text/JavaScript" src="Int64.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="3exSDK.js"&gt;&lt;/script&gt;
&lt;script *ype  ="text/javascript"&gt;
sdk = new threeExSDK({ 
host : "wss://marketinfo.3ex.com/", 
});  
sdk.connect();    
sdk.klineInfo('USDT', 'BTC', 2, 1, 0); 	//获取k线信息
					//参数
					//market: 市场名称
					//market: 市场名称
					//coin:	币种名称
					//type: k线类型 1:分时图, 2:分钟线, 3:小时线, 4:日线 , 5:周线
					//offset: k线跨度 分钟线(1,5,15,30), 小时线(1,2,4,6,12), 日线和周线(1)
					//time: k线结束时间戳 0:当前时间
					//
					//返回k线信息

//当前分钟K线
fn.MarketKLineCurrent=function(res){
	console.log("当前分钟k线:",res);
	/*
	["U市场名:币种名","[[时间戳,开始价格,最后价格,最低价格,最高价格,总额]]"]
	*/
	
};
&lt;/script&gt;	
</code></pre>
<h1>
<a id="user-content-3ex-websocket-sdk" class="anchor" href="#3ex-websocket-sdk" aria-hidden="true"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>3ex-Websocket-sdk</h1>
<p>用户可在 <a href="https://github.com/3ex/3ex.git">https://github.com/3ex/3ex.git</a> 下载Javasript Websocket sdk参考使用。</p>

            </div>

        </div>
