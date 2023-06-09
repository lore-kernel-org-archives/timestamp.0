Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E6182BE
	for <timestamp@lists.linux.dev>; Fri,  9 Jun 2023 15:11:37 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-33b04c8f3eeso7597115ab.0
        for <timestamp@lists.linux.dev>; Fri, 09 Jun 2023 08:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323497; x=1688915497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9Rb1e/uOkSXDB72S3Pmwrp86GlxpbraRGVRQBYFa9A=;
        b=Am139cjNxWfyPL+mEP9bfFEJR4YXP7zbkpdRaQxt2sljsCzh2RFvTQS+DcqmoUhBHu
         AfEyZ6Pu17Grs4J2tDjzEbDUWjNgrt+JB1FOnX6xcOWXbFzmwIExO9zyAno2v7jMXbeO
         D4zEKlkcMTDjMDYbfVxZnTnLHqky8+owmbTO4AgYL1Zu8tA8/9n6n8H4sIjuANdUZLUN
         je9Z+iLtQWeqPQyQ9lh8xlVSKIY5fHhs8AaE72cdn49mc9a2eepHxmOeI8ovyeoAIo5+
         WYfoglqiiH+U6JdkeO1kJyAWI38e3WYRj/WB89jHyHK1wbZeO6fmLZOiUIb16iIOy0YC
         sxcQ==
X-Gm-Message-State: AC+VfDx5esjNx2D7aaDuGbVtig5oaDhKxb4VFcbTlzvCZ3ToHM1WW6AT
	RSml9sFlLzEBzItWLuKg+A==
X-Google-Smtp-Source: ACHHUZ601MkzpccdrAQ864iVAYxlzaAgWUES/WkMk0l539+cvMHRtzNzn5Ol1LJOZoG08+96U43ndg==
X-Received: by 2002:a92:c98d:0:b0:33e:7269:bb7b with SMTP id y13-20020a92c98d000000b0033e7269bb7bmr1650478iln.3.1686323496915;
        Fri, 09 Jun 2023 08:11:36 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y16-20020a92c750000000b0033e62b47a49sm1124240ilp.41.2023.06.09.08.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:11:36 -0700 (PDT)
Received: (nullmailer pid 999255 invoked by uid 1000);
	Fri, 09 Jun 2023 15:11:33 -0000
Date: Fri, 9 Jun 2023 09:11:33 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>, linux-phy@lists.infradead.org, Dipen Patel <dipenp@nvidia.com>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org, Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, timestamp@lists.linux.dev, Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH 2/7] dt-bindings: pwm: restrict node name suffixes
Message-ID: <168632349292.998946.17372740217811972226.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>


On Tue, 30 May 2023 16:48:46 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to:
> 1. Only one unit address or one -N suffix,
> 2. -N suffixes to decimal numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

