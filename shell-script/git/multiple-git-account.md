# Sử dụng nhiều github account trên 1 máy tính

Bước 1: Gen 2 ssh key khác nhau 

Bước 2: Config trong ~/.ssh/config
```
Host github.com-tungjj
        HostName github.com
        User git
        IdentityFile ~/.ssh/tungjj
```

Bước 3: Trong project, add 1 remote có host là alias host phía trên

```
git remote add origin git@github.com-tungjj/til.git

```