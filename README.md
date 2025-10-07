# 1. 修复了原本 supershell 死 shell bug

# 2. 增加了进程伪造的功能和删除了显示日志

# 3. 升级了控制核心 reverse_ssh

# 4. 使用方法
### 1、直接运行docker-compose up -d
### 2、若需要改端口，则需要修改三个文件,docker-compose.yml中修改rssh的端口(使用cdn上线和wss协议最好修改成443端口),还需要修改const.py中rssh_port和rssh目录下docker-entrypoint.sh中的端口，并确保一致
### 3、如果是想备份之前的supershell,则需要将之前项目下volume整个目录移植过去,但是要确保本项目/volume/rssh/cache/data.db不能丢失
### 4、如果需要指定客户端连接时看到的外部访问地址，请在执行 `docker compose up -d` 前运行 `export EXTERNAL_ADDRESS=47.236.199.36:3232`（或替换为实际地址），也可以在 `.env` 中设置 `EXTERNAL_ADDRESS`，未设置时默认值为 `:3232`
