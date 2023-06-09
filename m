Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1D18AF8
	for <timestamp@lists.linux.dev>; Fri,  9 Jun 2023 15:14:01 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-33b6c47898dso8257715ab.0
        for <timestamp@lists.linux.dev>; Fri, 09 Jun 2023 08:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323640; x=1688915640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlnLe4pfATl+DHVBwqaw0v4jPbOyjTsxndvN+13DO4U=;
        b=c8YLMAEWdqiq1NSgxXNnZX9eAnrQQv+6Ax7AF0/UefULdAHDmvS50HGvCsze3SUqS3
         SBl9rEO3sDSeNcUyxIpI7otanv84KRx7ze1J1PwHmc9Fi9hCwuw6C7Cr6dUQqlYa44zl
         bRYWKSqCumAgVhKn5HexyGD4JAoMjJRuvyYlNF2m9KNoJZdeRyHhjs/TFi5bNFycbP70
         JFHn3wEe0zuH/9dapeiRzZDmfZcTgJAQERK9JWfJMskmrSjJpugv6pC1TEomgsfvOy78
         F/i/FDHCr05wRYGtLbP6yuv6WLODZ4MGiuXj21RZTQJzS438n0z/vWQgoOSU9gGzkFpf
         pVvA==
X-Gm-Message-State: AC+VfDwRmXWfzKI+HPUAz4TIqMUuhp/fXpDRe2FBgFQ5z9ze189xctJw
	g0koPJ3ja4blQ3S6fCZ/dA==
X-Google-Smtp-Source: ACHHUZ67MRb0rJmdn4+48gimm54npOx3rXtHVsKxV43QbkTdBE7Slc8n9FZ20Hgxkb+KSwVkDi+hYQ==
X-Received: by 2002:a92:d590:0:b0:33d:72c0:1b4 with SMTP id a16-20020a92d590000000b0033d72c001b4mr1757273iln.10.1686323640384;
        Fri, 09 Jun 2023 08:14:00 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id z3-20020a92bf03000000b0032b72b5c1c3sm1136035ilh.9.2023.06.09.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:13:59 -0700 (PDT)
Received: (nullmailer pid 1011188 invoked by uid 1000);
	Fri, 09 Jun 2023 15:13:57 -0000
Date: Fri, 9 Jun 2023 09:13:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>, Dilip Kota <eswara.kota@linux.intel.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, timestamp@lists.linux.dev, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-phy@lists.infradead.org, Oleksij Rempel <o.rempel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, Dipen Patel <dipenp@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/7] dt-bindings: timestamp: restrict node name suffixes
Message-ID: <168632363634.1011122.1495504884843410484.robh@kernel.org>
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

Acked-by: Rob Herring <robh@kernel.org>

