######
# with requirements.txt
#######


FROM ubuntu:latest
WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       #       build essentials
       locales \
       python3-pip \
       python3-yaml \
       rsyslog systemd systemd-cron sudo \
    && apt-get clean
RUN pip3 install --upgrade pip
RUN pip3 freeze > requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install streamlit

COPY / ./
 # Tell the image what to do when it starts as a container
 EXPOSE 8501
CMD ["streamlit", "run", "main.py"]



######
# with pipreqs
#######

# FROM ubuntu:latest
# WORKDIR /app

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#        apt-utils \
#        #       build essentials
#        locales \
#        python3-pip \
#        python3-yaml \
#        rsyslog systemd systemd-cron sudo \
#     && apt-get clean
# RUN pip3 install --upgrade pip
# # RUN pip3 freeze > requirements.txt
# RUN pip3 install pipreqs
# RUN pipreqs ./
# # RUN pip3 install -r requirements.txt
# RUN pip3 install streamlit

# COPY / ./
#  # Tell the image what to do when it starts as a container
# EXPOSE 8501
# CMD ["streamlit", "run", "main.py"]


