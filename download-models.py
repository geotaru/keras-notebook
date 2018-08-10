#!/usr/bin/env python

from keras.applications import ResNet50, VGG16, VGG19, Xception, InceptionV3, InceptionResNetV2, MobileNet, MobileNetV2
from keras.applications.densenet import DenseNet121, DenseNet169, DenseNet201
from keras.applications.nasnet import NASNetLarge, NASNetMobile


def download_model(model):
    try:
        model_with_top = model(weights='imagenet')
        model_with_top.summary()
    except ValueError:
        pass
    try:
        model_no_top = model(weights='imagenet', include_top=False)
        model_no_top.summary()
    except ValueError:
        pass
    return None


def main():
    """
    Download models with weights of imagenet
    """
    print("----------------- ResNet50 --------------------")
    download_model(ResNet50)
    print("----------------- VGG16 -----------------------")
    download_model(VGG16)
    print("----------------- VGG19 -----------------------")
    download_model(VGG19)
    print("----------------- Xception --------------------")
    download_model(Xception)
    print("----------------- InceptionV3 -----------------")
    download_model(InceptionV3)
    print("----------------- InceptionResNetV2 -----------")
    download_model(InceptionResNetV2)
    print("----------------- MobileNet -------------------")
    download_model(MobileNet)
    print("----------------- MobileNetV2 -----------------")
    download_model(MobileNetV2)
    print("----------------- NASNetLarge -----------------")
    download_model(NASNetLarge)
    print("----------------- NASNetMobile ----------------")
    download_model(NASNetMobile)
    print("----------------- DenseNet121 -----------------")
    download_model(DenseNet121)
    print("----------------- DenseNet169 -----------------")
    download_model(DenseNet169)
    print("----------------- DenseNet201 -----------------")
    download_model(DenseNet201)
    return None


if __name__ == "__main__":
    main()
