FROM adoptopenjdk/openjdk15 as builder

COPY . .

RUN chmod +x ./gradlew

RUN ./gradlew --no-daemon installDist

FROM adoptopenjdk/openjdk15

WORKDIR /user/app

COPY --from=builder build/install/DynamicBio ./

ENTRYPOINT ["/user/app/bin/DynamicBio"]
