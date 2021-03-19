FROM python:3.9

WORKDIR /advance
1
COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "--noreload"]
