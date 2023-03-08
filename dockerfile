FROM python:alpine3.17
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
CMD http://lcoalhost:5000/health || exit 1 
ENTRYPOINT [ "python", "./src/app.py" ]

