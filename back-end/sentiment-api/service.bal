import ballerina/http;
import ballerina/log;

listener http:Listener sentiment_ls = new (9000);

service /text\-processing on sentiment_ls {

    public function init() {
        log:printInfo("Sentiment analysis service started");
    }

    isolated resource function post api/sentiment(Post post) returns Sentiment|http:ServiceUnavailable {
        // Return a dummy response
        return {
            probability: {
                neg: 0.30135019761690551,
                neutral: 0.27119050546800266,
                pos: 0.69864980238309449
            },
            label: POSITIVE
        };
    }
}

type Probability record {
    decimal neg;
    decimal neutral;
    decimal pos;
};

enum SENTIMENT_LABEL {
    NEGATIVE = "neg",
    NEUTRAL = "neutral",
    POSITIVE = "pos"
};

type Sentiment record {
    Probability probability;
    SENTIMENT_LABEL label;
};

type Post record {
    string text;
};

