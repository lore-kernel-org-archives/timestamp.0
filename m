Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F6944E
	for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 13:58:40 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id bm2so7287586oib.4
        for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 06:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679579919;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVw/HyiqQinxdmesEdwJBI8XqbksiKkvSMPWgnEyvB0=;
        b=HCM+3tF9AA6Olew4+haleCiyTi1EwjZepva4FMyY9ovYtymDQKulGgy40qUCXuA4jp
         gc0Jd/IgFmmEoZw8ubbeBbXtn+3OYWidv39os90wFC0H0HAp77ozq1o8aSO7wFncOrcv
         5Uwhe2cpj4shsaCqHM05xvNzbysrpAxcmGQrwREpC0wTz7py8wHOyM93Jzn7tfLj+Nyb
         +4pvXh5udQWnUGDE5yYpNxt0FqCFdLAVs484UIyWlWfevJYIcaljdz7/VBtz0xBNj5kA
         eEPEn5HUiyBnLPZ5RrUsU3oT9ddVifGPK7H4SYJgXsZRWi28G7jDBgK8URc6Xz12VAv9
         HyXw==
X-Gm-Message-State: AO0yUKVnav0PJY3Suk4QzuSRgavWgTuAB6AtpU5tizXKK9B573m8kptR
	9MtfaE3LTQPkqrn1Ns0sdQ==
X-Google-Smtp-Source: AK7set/M5HHQwM6tdu9DT7OW94VOkCo2pd0A9F13matxGUFM6Kj1MGiUiuoa8Vc7kGOWUK7VJ/fchA==
X-Received: by 2002:a05:6808:a09:b0:387:558e:c06e with SMTP id n9-20020a0568080a0900b00387558ec06emr1601283oij.43.1679579919325;
        Thu, 23 Mar 2023 06:58:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h22-20020a9d7996000000b0069d9a319817sm7531521otm.12.2023.03.23.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:58:38 -0700 (PDT)
Received: (nullmailer pid 3103737 invoked by uid 1000);
	Thu, 23 Mar 2023 13:58:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dipen Patel <dipenp@nvidia.com>
Cc: brgl@bgdev.pl, devicetree@vger.kernel.org, timestamp@lists.linux.dev, linux-doc@vger.kernel.org, corbet@lwn.net, jonathanh@nvidia.com, krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linus.walleij@linaro.org
In-Reply-To: <20230323012929.10815-5-dipenp@nvidia.com>
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-5-dipenp@nvidia.com>
Message-Id: <167957962972.3095212.10275948205449867756.robh@kernel.org>
Subject: Re: [PATCH V4 04/10] dt-bindings: timestamp: Add
 nvidia,gpio-controller
Date: Thu, 23 Mar 2023 08:58:37 -0500


On Wed, 22 Mar 2023 18:29:23 -0700, Dipen Patel wrote:
> Introducing nvidia,gpio-controller property from Tegra234 SoCs onwards.
> This is done to help below case.
> 
> Without this property code would look like:
> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
> 	hte_dev->c = gpiochip_find("tegra194-gpio-aon",
> 				   tegra_get_gpiochip_from_name);
> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-aon"))
> 	hte_dev->c = gpiochip_find("tegra234-gpio-aon",
> 				   tegra_get_gpiochip_from_name);
> else
> 	return -ENODEV;
> 
> This means for every future addition of the compatible string, if else
> condition statements have to be expanded.
> 
> With the property:
> gpio_ctrl = of_parse_phandle(dev->of_node, "nvidia,gpio-controller", 0);
> ....
> hte_dev->c = gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_node);
> 
> This simplifies the code significantly. The introdunction of this
> property/binding does not break existing Tegra194 provider driver.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  .../timestamp/nvidia,tegra194-hte.yaml        | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.example.dtb: timestamp@c1e0000: reg: [[0, 203292672], [0, 65536]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.example.dtb: timestamp@c1e0000: reg: [[0, 203292672], [0, 65536]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.example.dtb: timestamp@3aa0000: reg: [[0, 61472768], [0, 65536]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323012929.10815-5-dipenp@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

