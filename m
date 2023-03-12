Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDD46BB
	for <timestamp@lists.linux.dev>; Sun, 12 Mar 2023 15:49:21 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id da10so39428982edb.3
        for <timestamp@lists.linux.dev>; Sun, 12 Mar 2023 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678636159;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ze1sZZfvq/o3HPIuxYy3C9whN6R344n7Jno797TGzZw=;
        b=EdYr9Y2NNVd69Fe8ci4f1VHqYC77SF2qg/Jlybb2r7i6w9HWYRoDi3prZL6yLzRE8u
         zz4EZEEKzCvM+/kerG/cumr0hQs1hEkBBJfXfmXEHrJcbgUSf0l6lOTBudAG5Yudq1yZ
         z8l3mKtb5w+NwMPXFKZFOUwcy5qycSIyK99s+zo53XoIsl11nUwotJQD1cnHHCMN65VX
         mrSTQtqAhT3YNU207Oh300USWGnoSu7eIEWeCVS1XPVnZpn97/2h3MGCTOHD+NK4YV/y
         7zlveTFIHrRgwdp8tjAsvJyuxn666YWoURqbrrKWMnipMpxHOLkh1EeqG4Mcbna4v/uz
         5l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678636159;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze1sZZfvq/o3HPIuxYy3C9whN6R344n7Jno797TGzZw=;
        b=xvDXX5Lr7qkE2A4f0w1NwphoQVXVN3TfUoJbt9qds8319c+QtXc9/PqPQWy4LDhAQG
         MwNCgt+X1BcCFntnSumDNExcJNUlprqexl/DOIAPBuhO+5j0iMWmJbTXrNnDiZSu5lSP
         MY3OtnZv+YwYozpO8MitF9BkS2NVOGDtUid03hW7kdUJCZHbqlSPbstv9hloJ2Cr4P8O
         C8YTz3QNkNS9aiXJr9Ds7uSTDPVfE6B1oTpbKsyZ4tnNm4LhTI6+1J9+AEqiUfe27m5R
         tAagLEJ3D0OQoUbyP75uzqkcVAsr9kY/Iq7KLMFLIDBT0IylOyyq5f73v14jDVDk9TQe
         HKDQ==
X-Gm-Message-State: AO0yUKW+8LEi/FnMBXBjbJMlxsfjohyu3JedelOoMIW1dpB1Fly9NvZw
	kM4vPYYPyDI3hFYTmFhr3oMtRw==
X-Google-Smtp-Source: AK7set8udaJr3jonmmaxfmotBUdoyBVYzuKxMre3xI0ZisJg58IQP/BbH1HtpCaF3M/edo7bzjfXEg==
X-Received: by 2002:a17:907:2ceb:b0:88a:8e57:f063 with SMTP id hz11-20020a1709072ceb00b0088a8e57f063mr27906362ejc.62.1678636159425;
        Sun, 12 Mar 2023 08:49:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id pk10-20020a170906d7aa00b008d1693c212csm2349659ejb.8.2023.03.12.08.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 08:49:19 -0700 (PDT)
Message-ID: <be1eea98-ee16-751d-b833-72a8a667b553@linaro.org>
Date: Sun, 12 Mar 2023 16:49:17 +0100
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V3 4/6] hte: Add Tegra234 provider
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net,
 gregkh@linuxfoundation.org
References: <20230310190634.5053-1-dipenp@nvidia.com>
 <20230310190634.5053-5-dipenp@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310190634.5053-5-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2023 20:06, Dipen Patel wrote:
> This patch adds HTE provider support for the Tegra234 and reflects the
> changes made in the device tree as follow.
> - Add slices field in the SoC specific structure
> - Remove gpio chip find by name function instead make use of the phandle
> parsed from the DT node
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

(...)

>  	hte_dev->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(hte_dev->regs))
>  		return PTR_ERR(hte_dev->regs);
> @@ -635,8 +750,15 @@ static int tegra_hte_probe(struct platform_device *pdev)
>  
>  		gc->match_from_linedata = tegra_hte_match_from_linedata;
>  
> -		hte_dev->c = gpiochip_find("tegra194-gpio-aon",
> -					   tegra_get_gpiochip_from_name);
> +		gpio_ctrl = of_parse_phandle(dev->of_node,
> +					     "nvidia,gpio-controller", 0);
> +		if (!gpio_ctrl) {
> +			dev_err(dev, "gpio controller node not found\n");
> +			return -ENODEV;

This is non-bisectable patchset. Remember that DTS cannot go with the
code, thus your code should handle existing DTS (which is BTW already
released with v6.2).

Any remarks to comments that no ABI was broken back then in 2022 are not
valid now. They were valid that time, but sorry, the time passed.

Best regards,
Krzysztof

