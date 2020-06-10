# Struts2_Image
Build and Push Struts2 container image

This project builds the mydemo13/struts2_demo image and pushes it to Docker Hub. It takes three parameters to allow you to build different versions:

owner_email -- this is used to label the owner of the image
struts2_version -- the version of struts2-showcase to use. Defaults to 2.3.12, other valid values include 2.3.37 and 2.5.20.
tomcat_version -- The version of the tomcat base image to use. Defaults to 7, other valid values include 9 and latest.
