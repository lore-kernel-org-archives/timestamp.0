Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0728174D9
	for <timestamp@lists.linux.dev>; Fri, 30 Jun 2023 17:34:32 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-345d3c10bdfso8967755ab.2
        for <timestamp@lists.linux.dev>; Fri, 30 Jun 2023 10:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688146471; x=1690738471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQ94kfdEfq9RrPFyhfJUVdunZkyBAVzDUoOb8tFiC9I=;
        b=LbaJiWePfesk54DaGxpH7pSDMedKNOubC/1lmT5MLiHG4i5mJb8hyHETrBetlm+BcB
         pI5GbdW0cSdKo+r6Y5hYj8/iOV/a+IjTzygHG/fr+mGhUuycKNumrlkCcd6+06LuQjEv
         JEI2bZZs53GGwbFLV8uTD9iOFbDK050Sc7pUWIGZz3fG7vd6hmSFcz258e6xCuPP0djN
         an1Fnxh25naWmRYt8pncyrgedjyTy8bL/zAin6jn14p+N46YDpoi9CEh/6DRK008EgVd
         U/VIc1lCTtU7odNeK6QS8eMaxbw83tqwYTB92GN/eQ1kfESj/4b/HxlmQ4WP/zzt9im2
         5QCg==
X-Gm-Message-State: AC+VfDxzJOGvpEK1N8JHCtofc1iNvcwsSKAeANL2tByHQ/cxAOQD8c50
	WRm/jvKtIuUsxq3L9G7E0A==
X-Google-Smtp-Source: ACHHUZ4EbUs4PS9q79isRP9O3xuyN3VlPHEnyRoBjVZ32PU31b0maNUtRwGNVSbiOr7AKyybiYfTVQ==
X-Received: by 2002:a6b:a16:0:b0:783:694f:e791 with SMTP id z22-20020a6b0a16000000b00783694fe791mr3651652ioi.12.1688146471480;
        Fri, 30 Jun 2023 10:34:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id i17-20020a02ca51000000b0042af069eeefsm1830983jal.50.2023.06.30.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 10:34:30 -0700 (PDT)
Received: (nullmailer pid 2074728 invoked by uid 1000);
	Fri, 30 Jun 2023 17:34:28 -0000
Date: Fri, 30 Jun 2023 11:34:28 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dilip Kota <eswara.kota@linux.intel.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, timestamp@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Dipen Patel <dipenp@nvidia.com>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: timestamp: restrict node name suffixes
Message-ID: <168814645706.2074491.15762386958786625732.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>


On Tue, 30 May 2023 16:48:50 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to -N suffixes to decimal
> numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/timestamp/hardware-timestamps-common.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

