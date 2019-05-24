ARG TERRAFORM_VERSION=0.12.0
ARG TERRAGRUNT_VERSION=0.18.6

FROM hashicorp/terraform:$TERRAFORM_VERSION

ENV TERRAGRUNT_VERSION=0.18.6
ENV TERRAGRUNT_TFPATH=/bin/terraform

RUN apk add --no-cache --update curl git openssh-client ruby ruby-json ruby-dev make gcc musl-dev

RUN curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/v$TERRAGRUNT_VERSION/terragrunt_linux_amd64 -o /bin/terragrunt && chmod +x /bin/terragrunt
RUN apk del ruby-dev make gcc musl-dev curl

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["terragrunt"]