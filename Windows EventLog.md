
# Installing packages without ssl if needed and trusted source like pypi from CMD shell
    pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org PyPiWin32
    https://stackoverflow.com/questions/25981703/pip-install-fails-with-connection-error-ssl-certificate-verify-failed-certi


```python
import win32com.client as wincl #importing pypiwin32 module
import win32api
import win32evtlog
import win32api
import win32con
import win32security 
```


```python
server = "localhost"
log_type = '8'
log_handle = win32evtlog.OpenEventLog(server, log_type)
log_handle
```




    <PyEVTLOG_HANDLE:2695700152328>


