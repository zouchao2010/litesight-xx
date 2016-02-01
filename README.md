# litesight

## build
```shell
docker build -t zouchao2010/litesight .

```

## pull
```shell
docker pull zouchao2010/litesight

```

## run(创建并运行一个容器，退出时删除容器)
```shell
docker run  --name litesight \
            -h litesight \
            -p 4001:4001 \
            -v /data/litesight/.litecoin:/root/.litecoin \
            -v /data/litesight/.litecoin-insight:/root/.litecoin-insight \
            -it --rm zouchao2010/litesight
            
```

## run(创建并运行一个容器，以守护进程方式)
```shell
docker run  --name litesight \
            -h litesight \
            -p 4001:4001 \
            -v /data/litesight/.litecoin:/root/.litecoin \
            -v /data/litesight/.litecoin-insight:/root/.litecoin-insight \
            -dt zouchao2010/litesight
            
```

## start|stop|restart(已存在的容器)
```shell
docker start|stop|restart litesight

```

## exec(使用已运行的容器执行命令)
```shell
docker exec -it litesight /bin/bash

```
