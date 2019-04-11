## 使用

docker run -p 端口:端口 -d -v 本地:镜像内目录  -it 镜像 命令 

#docker run -it napoler/alpine_terry_python python
#docker run -d -v E:\:/terry  -it napoler/alpine_terry_python bash


## 进入容器
docker exec -t -i 6968f2928c17  bash


## 打包镜像

docker build -t alpine_aihelp ./



## 正常执行
docker run -d -v E:\:/myapp -it napoler/alpine_terry_python_flask



## 开发运行
docker run -d -p 5004:5000 -v E:/GitHub/aihelp:/myapp -it alpine_aihelp python

#防止假死
docker run  -t -i  napoler/aihelp bash


# 依赖包
## 生成
pip freeze >requirements.txt

## 安装
pip install -r requirements.txt


#mongodb

docker pull mongo-express

docker pull redis


# 命令行训练
 python3 d2v.py -p ./data/01/

# 跑host

python3 -m flask run --host=0.0.0.0
