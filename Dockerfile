# alpine is a version of python very light, with only the essential installed, no others dependencies
FROM python:3.9-alpine3.13
# who is maintaining the image
LABEL maintainer="mickaelyoshua"

# make the output goes directly to the console
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

    # creating a venv to avoid dependencies conflicts with the standard python environment
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    # best practice is not use the root user, so create a new one
    adduser \
        --disabled-password \
        # no create a home directory to keep the image lighter
        --no-create-home \
        djando-user

# define into the environment variables so will not bew necessary write /py/bin/
ENV PATH="/py/bin:$PATH"

# switch to the new user
USER djando-user