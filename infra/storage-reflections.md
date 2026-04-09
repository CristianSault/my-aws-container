1. Explain how your app allows users to upload and view photos in your S3 bucket despite the fact that objects in S3 buckets are private by default and you did NOT apply any policies that would override that default.

**Answer**

The app uses presigned URLs which are special URLs sent to AWS with encrypted logging data and act as temporary pass (for 1 hour) for the users that contain all the AWS necessary data to access objects in the S3 bucket like IAM data.

The necessary data is an S3 bucket, an object key, an HTTP method, and an expiration time interval.

2. Explain why the two GSIs you created are useful, and why the specific attributes used for the hash and range keys are the right choices for those GSIs.

**Answer**

TL;DR GSIs work similar to normal indexes for databases in which they speed up reading operations at the cost of slower writing operations but GSIs work for DynamoDB.

The specific attributes "feed_key" and "uploaded_at" for the hash and range keys coincide with the names of the _item_ attributes in the `upload_photo()` method in the `photos.py` file so it connects the data properly.
