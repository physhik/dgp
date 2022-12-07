FROM python:3.10

WORKDIR /app/backend

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED=1

# Install Python dependencies
COPY requirements.txt /app/backend
RUN pip install -r requirements.txt
COPY manage.py /app/backend


# Add the rest of the code
COPY mysite/ /app/backend/mysite/
COPY polls/ /app/backend/polls/

# Make port 8000 available for the app
EXPOSE 8000

# Be sure to use 0.0.0.0 for the host within the Docker container,
# otherwise the browser won't be able to find it
CMD python manage.py runserver 0.0.0.0:8000