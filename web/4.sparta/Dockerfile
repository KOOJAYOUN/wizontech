FROM python:3.10.1
COPY ./bucket/ .
COPY requirements.txt .
RUN pip3 install -r requirements.txt --no-cache-dir

WORKDIR /bucket/
EXPOSE 5000

#CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
CMD ["python", "/bucket/app.py"]