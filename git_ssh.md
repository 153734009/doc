##github设置公钥秘钥-实现免登陆提交##
@enviroment CentOS-6.6  64bit
@author     153734009
@since      2015年12月11日  
支持多项目

----------
###简介###
git服务器常用SSH私钥公钥对来进行授权，这样可以省却登陆提交  
公私钥的核心思想是：加密和解密采用不同的密钥。公钥私钥必须成对出现，互为加解密。
###1. 生成秘钥对
1. ssh-keygen -C "your_email@qq.com"  
    设置路径:/root/.ssh/your_project_rsa（回车）  
    设置密码:password（回车）  
    重复密码:password（回车）  
    这样就会在你指定的/root/.ssh/目录下生成一对公钥-私钥:your_project_rsa/your_project_rsa.pub
        建议不设置密码，直接回车,这样使用秘钥的时候就不需要输入密码了；否则使用秘钥的时候要输入密码，更坑。
  
2. 将公钥加入到github的具体项目[AnolePHP](https://github.com/153734009/AnolePHP)  
    该项目设置的地址如下：https://github.com/153734009/AnolePHP/settings/keys
        页面上点击Settings->Deply keys->Add deploy key  
        cat /root/.ssh/your_project_rsa.pub
        内容以 "ssh-rsa" 开头
  
3. 测试连接：ssh -T git@github.com  
    这样其实已经设置成功，可用秘钥直接访问。
    成功时提示：
            Hi 153734009/your_project! You've successfully authenticated, but GitHub does not provide shell access.
  
4. 设置config文件，令其支持多项目  
    (Host project中的project是简称，以后连接远程服务器就可以用命令ssh project;简称还要和具体的git项目的配置关联上才有用。 注意下面有缩进)
        Host project 
            HostName github.com
            User git
            PubkeyAuthentication yes
            IdentityFile ~/.ssh/your_project_rsa
  
5. 克隆项目：git clone git@github.com:153734009/AnolePHP.git
  
6. 设置简称：git remote add origin git@project:153734009/AnolePHP.git
        其中的origin 建议使用origin;这样可以用git push直接提交  
        否则如果设成  
        git remote add anole git@github.com:153734009/AnolePHP.git  
        需要些git push anole 才能正确提交  
        git@project:153734009 中的project是简称；要和上面的配置一致
  
7. 顺便提一下几个简单的命令
        git --help (永远都很好用)
        git add .
        git commit -m "description"
        git push
