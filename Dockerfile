# 将官方 Python 运行时用作父镜像
FROM ubuntu:16.04

#维护者信息
MAINTAINER docker_user jishuzhai_1208@126.com

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y python-pip python-dev python3.5 python3-pip && apt-get clean

RUN rm /usr/bin/python
RUN ln -s /usr/bin/python3.5 /usr/bin/python
# 安装 requirements.txt 中指定的任何所需软件包
ADD ./code/requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt


# 使端口 80 可供此容器外的环境使用
EXPOSE 10410

# 在容器启动时运行 app.py
CMD ["python", "DCloudMaster.py"]