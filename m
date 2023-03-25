Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8020EE
	for <timestamp@lists.linux.dev>; Sat, 25 Mar 2023 11:07:12 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id ek18so17349229edb.6
        for <timestamp@lists.linux.dev>; Sat, 25 Mar 2023 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742430;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CascLyJzZUOt+NFlQIOgyTD4nfRGhZRKLKtQ8zQSi9U=;
        b=YPpeCxYQoKYGfhN6KKafRsnOFj76TONkcUKYKNcihDG0tDYt729aMFX4XeIIL3PFyP
         2nUcFaRBwB2FPHWfT2k1KDRPKn415bkdFr/XAPL1A99v6ljk9gJifXuU/3Rfa7eqlBoX
         rpNIariA1DhmZ9Hb7ZD03EmdGm9DuchTFcmuE135V3umB3jT/gjtGNq8u2Jd4q31jHjg
         7pyAczMlCl7moTjZ2mK1DC4ZpVxyJFwmBMGnwq4OblUaUZwg3iFz9qHxaa75ikeWWmW3
         6ochDItiqml8w47OILwe+Eh2vhIdJ2GGQSCPgkRjQ066ZP+dayivXNq2vzkgjA5MJzVn
         owUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742430;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CascLyJzZUOt+NFlQIOgyTD4nfRGhZRKLKtQ8zQSi9U=;
        b=vy3BciRVnesqwZdVT4CW0j+eri2BwSU0RN0/cjnMKPlLZXvNtyU1P1JX55hlez1Rnn
         +lQdLt7nwtX7nrXKtXs+Qx2lvzRcitiKeZ0W6FfkgHO/8IUHE/sEfNAV5ooZA47Ffpn2
         1nq8QiT3gh6Hpfnr7neE4xPW78u6+6W3umpAJErJ8aYTTHHI5nEZWYGY4WJijg0GOugw
         di4+tb09T3OBhUFWo8uvTJT1QM2jBjPQ/YAcWkJfrYt1IDSMuSBl0dhgNcCj4qtqJW4+
         LH2Yepnge0UCJ854J9OUdjdB1O+hjxerfMn9Blbef8lGx9athQw30v9jnhW/7mKBeysY
         8w4g==
X-Gm-Message-State: AAQBX9fYWRF69GWptNS1XyGvz4GTpl24ps38IdbP2Z7MEpWYxziuVWEp
	L5zes94eWDAx4hlS6WoF4BLVpw==
X-Google-Smtp-Source: AKy350adXyf91NFnhoyGL54kEKdOIxtiBaIwDtD3VIVxExhVv7EULwn726vTBmZdpi4qDqZa99odyw==
X-Received: by 2002:a17:906:2f96:b0:932:8cd:1021 with SMTP id w22-20020a1709062f9600b0093208cd1021mr5442052eji.33.1679742430284;
        Sat, 25 Mar 2023 04:07:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b009334edaed98sm9347699ejc.50.2023.03.25.04.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:07:09 -0700 (PDT)
Message-ID: <f523c155-7d05-2034-27ea-e2e56881c0bb@linaro.org>
Date: Sat, 25 Mar 2023 12:07:08 +0100
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 04/10] dt-bindings: timestamp: Add
 nvidia,gpio-controller
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net,
 gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-5-dipenp@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323012929.10815-5-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/03/2023 02:29, Dipen Patel wrote:
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
> diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
> index eafc33e9ae2e..841273a3d8ae 100644
> --- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
> +++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
> @@ -51,6 +51,12 @@ properties:
>        LIC instance has 11 slices and Tegra234 LIC has 17 slices.
>      enum: [3, 11, 17]
>  
> +  nvidia,gpio-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to AON gpio controller instance. This is required to handle
> +      namespace conversion between GPIO and GTE.
> +
>    '#timestamp-cells':
>      description:
>        This represents number of line id arguments as specified by the
> @@ -65,22 +71,43 @@ required:
>    - interrupts
>    - "#timestamp-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra234-gte-aon
> +    then:
> +      required:
> +        - nvidia,gpio-controller
> +
>  additionalProperties: false
>  
>  examples:
>    - |
>      tegra_hte_aon: timestamp@c1e0000 {
>                compatible = "nvidia,tegra194-gte-aon";
> -              reg = <0xc1e0000 0x10000>;
> +              reg = <0x0 0xc1e0000 0x0 0x10000>;

This is not really explained in commit msg... are you sure you tested it?


Best regards,
Krzysztof

